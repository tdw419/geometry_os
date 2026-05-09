; DESCRIPTION: Renders a green box of size 42x98 starting at (295, 115).
; PLAN: r0=295(x), r1=115(y), r2=42(width), r3=98(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 295
LDI r1, 115
LDI r2, 42
LDI r3, 98
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
