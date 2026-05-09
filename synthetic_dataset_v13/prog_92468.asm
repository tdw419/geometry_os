; DESCRIPTION: Creates a black rectangular region at (46, 127) spanning 12 by 27 pixels.
; PLAN: r0=46(x), r1=127(y), r2=12(width), r3=27(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 127
LDI r2, 12
LDI r3, 27
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
