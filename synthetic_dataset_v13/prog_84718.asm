; DESCRIPTION: Renders a green box of size 61x39 starting at (252, 174).
; PLAN: r0=252(x), r1=174(y), r2=61(width), r3=39(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 174
LDI r2, 61
LDI r3, 39
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
