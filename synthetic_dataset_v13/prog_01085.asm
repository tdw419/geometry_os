; DESCRIPTION: Renders a black box of size 50x113 starting at (231, 91).
; PLAN: r0=231(x), r1=91(y), r2=50(width), r3=113(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 91
LDI r2, 50
LDI r3, 113
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
