; DESCRIPTION: Renders a cyan box of size 72x115 starting at (254, 75).
; PLAN: r0=254(x), r1=75(y), r2=72(width), r3=115(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 75
LDI r2, 72
LDI r3, 115
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
