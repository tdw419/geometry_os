; DESCRIPTION: Places a orange 42x56 rectangle at position (303, 186).
; PLAN: r0=303(x), r1=186(y), r2=42(width), r3=56(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 186
LDI r2, 42
LDI r3, 56
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
