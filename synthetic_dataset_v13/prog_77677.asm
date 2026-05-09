; DESCRIPTION: Renders a black box of size 82x50 starting at (310, 174).
; PLAN: r0=310(x), r1=174(y), r2=82(width), r3=50(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 174
LDI r2, 82
LDI r3, 50
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
