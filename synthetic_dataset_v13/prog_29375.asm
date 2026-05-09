; DESCRIPTION: Renders a cyan box of size 20x104 starting at (435, 57).
; PLAN: r0=435(x), r1=57(y), r2=20(width), r3=104(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 435
LDI r1, 57
LDI r2, 20
LDI r3, 104
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
