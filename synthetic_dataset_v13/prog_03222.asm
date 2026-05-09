; DESCRIPTION: Places a orange 109x50 rectangle at position (380, 177).
; PLAN: r0=380(x), r1=177(y), r2=109(width), r3=50(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 177
LDI r2, 109
LDI r3, 50
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
