; DESCRIPTION: Places a red 87x45 rectangle at position (295, 176).
; PLAN: r0=295(x), r1=176(y), r2=87(width), r3=45(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 295
LDI r1, 176
LDI r2, 87
LDI r3, 45
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
