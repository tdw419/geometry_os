; DESCRIPTION: Places a orange 71x65 rectangle at position (228, 50).
; PLAN: r0=228(x), r1=50(y), r2=71(width), r3=65(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 50
LDI r2, 71
LDI r3, 65
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
