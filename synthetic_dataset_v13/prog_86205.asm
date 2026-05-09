; DESCRIPTION: Places a yellow 21x108 rectangle at position (399, 113).
; PLAN: r0=399(x), r1=113(y), r2=21(width), r3=108(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 113
LDI r2, 21
LDI r3, 108
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
