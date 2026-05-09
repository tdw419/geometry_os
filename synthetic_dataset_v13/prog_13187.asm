; DESCRIPTION: Creates a blue rectangular region at (394, 207) spanning 23 by 42 pixels.
; PLAN: r0=394(x), r1=207(y), r2=23(width), r3=42(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 394
LDI r1, 207
LDI r2, 23
LDI r3, 42
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
