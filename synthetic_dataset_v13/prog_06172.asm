; DESCRIPTION: Places a purple 82x77 rectangle at position (283, 146).
; PLAN: r0=283(x), r1=146(y), r2=82(width), r3=77(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 146
LDI r2, 82
LDI r3, 77
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
