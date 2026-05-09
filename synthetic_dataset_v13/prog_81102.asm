; DESCRIPTION: Creates a orange rectangular region at (46, 197) spanning 42 by 51 pixels.
; PLAN: r0=46(x), r1=197(y), r2=42(width), r3=51(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 197
LDI r2, 42
LDI r3, 51
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
