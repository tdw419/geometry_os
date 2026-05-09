; DESCRIPTION: Creates a orange rectangular region at (333, 125) spanning 27 by 117 pixels.
; PLAN: r0=333(x), r1=125(y), r2=27(width), r3=117(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 125
LDI r2, 27
LDI r3, 117
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
