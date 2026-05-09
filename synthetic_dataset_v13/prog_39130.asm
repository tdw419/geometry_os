; DESCRIPTION: Creates a black rectangular region at (115, 120) spanning 87 by 42 pixels.
; PLAN: r0=115(x), r1=120(y), r2=87(width), r3=42(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 120
LDI r2, 87
LDI r3, 42
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
