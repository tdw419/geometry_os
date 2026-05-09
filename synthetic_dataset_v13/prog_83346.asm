; DESCRIPTION: Renders a cyan box of size 113x12 starting at (133, 45).
; PLAN: r0=133(x), r1=45(y), r2=113(width), r3=12(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 45
LDI r2, 113
LDI r3, 12
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
