; DESCRIPTION: Renders a cyan box of size 109x47 starting at (193, 172).
; PLAN: r0=193(x), r1=172(y), r2=109(width), r3=47(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 172
LDI r2, 109
LDI r3, 47
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
