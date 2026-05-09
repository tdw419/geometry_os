; DESCRIPTION: Renders a cyan box of size 73x43 starting at (16, 50).
; PLAN: r0=16(x), r1=50(y), r2=73(width), r3=43(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 50
LDI r2, 73
LDI r3, 43
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
