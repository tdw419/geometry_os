; DESCRIPTION: Places a red 21x97 rectangle at position (224, 126).
; PLAN: r0=224(x), r1=126(y), r2=21(width), r3=97(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 126
LDI r2, 21
LDI r3, 97
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
