; DESCRIPTION: Places a yellow 71x77 rectangle at position (334, 4).
; PLAN: r0=334(x), r1=4(y), r2=71(width), r3=77(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 4
LDI r2, 71
LDI r3, 77
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
