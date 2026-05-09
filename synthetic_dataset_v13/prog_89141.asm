; DESCRIPTION: Renders a blue box of size 91x72 starting at (173, 174).
; PLAN: r0=173(x), r1=174(y), r2=91(width), r3=72(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 174
LDI r2, 91
LDI r3, 72
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
