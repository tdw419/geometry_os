; DESCRIPTION: Renders a black box of size 50x77 starting at (178, 143).
; PLAN: r0=178(x), r1=143(y), r2=50(width), r3=77(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 143
LDI r2, 50
LDI r3, 77
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
