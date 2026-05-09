; DESCRIPTION: Renders a cyan box of size 87x100 starting at (360, 80).
; PLAN: r0=360(x), r1=80(y), r2=87(width), r3=100(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 360
LDI r1, 80
LDI r2, 87
LDI r3, 100
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
