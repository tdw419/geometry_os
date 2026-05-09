; DESCRIPTION: Renders a orange box of size 115x50 starting at (236, 195).
; PLAN: r0=236(x), r1=195(y), r2=115(width), r3=50(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 195
LDI r2, 115
LDI r3, 50
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
