; DESCRIPTION: Places a orange 61x50 rectangle at position (130, 204).
; PLAN: r0=130(x), r1=204(y), r2=61(width), r3=50(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 204
LDI r2, 61
LDI r3, 50
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
