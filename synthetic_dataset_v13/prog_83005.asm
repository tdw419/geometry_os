; DESCRIPTION: Places a green 87x77 rectangle at position (281, 54).
; PLAN: r0=281(x), r1=54(y), r2=87(width), r3=77(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 281
LDI r1, 54
LDI r2, 87
LDI r3, 77
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
