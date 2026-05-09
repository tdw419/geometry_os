; DESCRIPTION: Places a cyan 21x90 rectangle at position (443, 5).
; PLAN: r0=443(x), r1=5(y), r2=21(width), r3=90(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 443
LDI r1, 5
LDI r2, 21
LDI r3, 90
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
