; DESCRIPTION: Creates a orange rectangular region at (439, 47) spanning 63 by 50 pixels.
; PLAN: r0=439(x), r1=47(y), r2=63(width), r3=50(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 439
LDI r1, 47
LDI r2, 63
LDI r3, 50
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
