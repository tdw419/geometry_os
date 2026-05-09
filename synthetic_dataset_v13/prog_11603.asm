; DESCRIPTION: Places a orange 46x77 rectangle at position (369, 156).
; PLAN: r0=369(x), r1=156(y), r2=46(width), r3=77(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 156
LDI r2, 46
LDI r3, 77
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
