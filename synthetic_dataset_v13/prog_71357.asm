; DESCRIPTION: Creates a orange rectangular region at (197, 143) spanning 96 by 94 pixels.
; PLAN: r0=197(x), r1=143(y), r2=96(width), r3=94(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 143
LDI r2, 96
LDI r3, 94
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
