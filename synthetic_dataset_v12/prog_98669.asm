; DESCRIPTION: Places a yellow 27x85 rectangle at position (438, 12).
; PLAN: r0=438(x), r1=12(y), r2=27(width), r3=85(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 438
LDI r1, 12
LDI r2, 27
LDI r3, 85
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
