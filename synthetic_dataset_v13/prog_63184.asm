; DESCRIPTION: Renders a cyan box of size 21x27 starting at (260, 184).
; PLAN: r0=260(x), r1=184(y), r2=21(width), r3=27(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 184
LDI r2, 21
LDI r3, 27
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
