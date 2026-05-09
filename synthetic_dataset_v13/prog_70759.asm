; DESCRIPTION: Composite: Places a yellow 77x59 rectangle at position (103, 138) then Draws a cyan line from (511, 27) to (384, 65).
; PLAN: r0=103(x), r1=138(y), r2=77(width), r3=59(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=511(x1), r6=27(y1), r7=384(x2), r8=65(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 103
LDI r1, 138
LDI r2, 77
LDI r3, 59
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 511
LDI r6, 27
LDI r7, 384
LDI r8, 65
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
