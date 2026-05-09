; DESCRIPTION: Renders a cyan box of size 53x115 starting at (220, 115).
; PLAN: r0=220(x), r1=115(y), r2=53(width), r3=115(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 115
LDI r2, 53
LDI r3, 115
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
