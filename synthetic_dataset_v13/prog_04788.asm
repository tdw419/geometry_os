; DESCRIPTION: Places a yellow 48x77 rectangle at position (280, 56).
; PLAN: r0=280(x), r1=56(y), r2=48(width), r3=77(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 280
LDI r1, 56
LDI r2, 48
LDI r3, 77
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
