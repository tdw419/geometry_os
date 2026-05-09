; DESCRIPTION: Places a yellow 62x67 rectangle at position (195, 174).
; PLAN: r0=195(x), r1=174(y), r2=62(width), r3=67(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 174
LDI r2, 62
LDI r3, 67
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
