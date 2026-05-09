; DESCRIPTION: Places a white 94x112 rectangle at position (228, 86).
; PLAN: r0=228(x), r1=86(y), r2=94(width), r3=112(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 86
LDI r2, 94
LDI r3, 112
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
