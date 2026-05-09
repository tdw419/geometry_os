; DESCRIPTION: Renders a cyan box of size 60x115 starting at (171, 30).
; PLAN: r0=171(x), r1=30(y), r2=60(width), r3=115(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 30
LDI r2, 60
LDI r3, 115
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
