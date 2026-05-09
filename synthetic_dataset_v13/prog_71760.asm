; DESCRIPTION: Composite: Places a cyan 57x81 rectangle at position (453, 7) then Places a orange circle of radius 48 at center (315, 54).
; PLAN: r0=453(x), r1=7(y), r2=57(width), r3=81(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=315(x), r6=54(y), r7=48(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 453
LDI r1, 7
LDI r2, 57
LDI r3, 81
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 315
LDI r6, 54
LDI r7, 48
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
