; DESCRIPTION: Places a yellow 87x63 rectangle at position (245, 83).
; PLAN: r0=245(x), r1=83(y), r2=87(width), r3=63(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 83
LDI r2, 87
LDI r3, 63
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
