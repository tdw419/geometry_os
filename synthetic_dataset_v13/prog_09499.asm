; DESCRIPTION: Creates a cyan rectangular region at (104, 56) spanning 50 by 42 pixels.
; PLAN: r0=104(x), r1=56(y), r2=50(width), r3=42(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 56
LDI r2, 50
LDI r3, 42
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
