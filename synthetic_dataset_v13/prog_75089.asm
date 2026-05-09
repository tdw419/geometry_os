; DESCRIPTION: Places a yellow 90x82 rectangle at position (71, 132).
; PLAN: r0=71(x), r1=132(y), r2=90(width), r3=82(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 132
LDI r2, 90
LDI r3, 82
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
