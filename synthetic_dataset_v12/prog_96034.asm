; DESCRIPTION: Composite: Places a black 15x87 rectangle at position (238, 16) then Renders a white line between points (215, 168) and (24, 87).
; PLAN: r0=238(x), r1=16(y), r2=15(width), r3=87(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=215(x1), r6=168(y1), r7=24(x2), r8=87(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 238
LDI r1, 16
LDI r2, 15
LDI r3, 87
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 215
LDI r6, 168
LDI r7, 24
LDI r8, 87
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
