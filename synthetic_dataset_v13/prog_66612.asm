; DESCRIPTION: Places a yellow 77x108 rectangle at position (272, 113).
; PLAN: r0=272(x), r1=113(y), r2=77(width), r3=108(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 113
LDI r2, 77
LDI r3, 108
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
