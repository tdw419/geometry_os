; DESCRIPTION: Composite: Places a cyan 32x48 rectangle at position (274, 124) then Draws a yellow line from (377, 146) to (209, 12).
; PLAN: r0=274(x), r1=124(y), r2=32(width), r3=48(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=377(x1), r6=146(y1), r7=209(x2), r8=12(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 274
LDI r1, 124
LDI r2, 32
LDI r3, 48
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 377
LDI r6, 146
LDI r7, 209
LDI r8, 12
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
