; DESCRIPTION: Places a cyan 120x112 rectangle at position (283, 52).
; PLAN: r0=283(x), r1=52(y), r2=120(width), r3=112(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 52
LDI r2, 120
LDI r3, 112
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
