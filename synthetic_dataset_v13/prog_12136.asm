; DESCRIPTION: Composite: Renders a green line between points (93, 247) and (82, 32) then Renders a white box of size 64x51 starting at (442, 68).
; PLAN: r0=93(x1), r1=247(y1), r2=82(x2), r3=32(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=442(x), r6=68(y), r7=64(width), r8=51(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 93
LDI r1, 247
LDI r2, 82
LDI r3, 32
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 442
LDI r6, 68
LDI r7, 64
LDI r8, 51
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
