; DESCRIPTION: Renders a cyan box of size 87x55 starting at (425, 123).
; PLAN: r0=425(x), r1=123(y), r2=87(width), r3=55(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 425
LDI r1, 123
LDI r2, 87
LDI r3, 55
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
