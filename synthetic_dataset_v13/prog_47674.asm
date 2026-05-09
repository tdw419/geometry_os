; DESCRIPTION: Renders a black box of size 73x42 starting at (295, 38).
; PLAN: r0=295(x), r1=38(y), r2=73(width), r3=42(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 295
LDI r1, 38
LDI r2, 73
LDI r3, 42
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
