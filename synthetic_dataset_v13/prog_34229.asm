; DESCRIPTION: Places a cyan 12x52 rectangle at position (124, 71).
; PLAN: r0=124(x), r1=71(y), r2=12(width), r3=52(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 71
LDI r2, 12
LDI r3, 52
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
