; DESCRIPTION: Places a cyan 120x55 rectangle at position (130, 50).
; PLAN: r0=130(x), r1=50(y), r2=120(width), r3=55(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 50
LDI r2, 120
LDI r3, 55
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
