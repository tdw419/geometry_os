; DESCRIPTION: Renders a cyan box of size 61x115 starting at (171, 71).
; PLAN: r0=171(x), r1=71(y), r2=61(width), r3=115(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 71
LDI r2, 61
LDI r3, 115
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
