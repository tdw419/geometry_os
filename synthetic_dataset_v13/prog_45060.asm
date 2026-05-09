; DESCRIPTION: Renders a cyan box of size 61x58 starting at (368, 141).
; PLAN: r0=368(x), r1=141(y), r2=61(width), r3=58(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 141
LDI r2, 61
LDI r3, 58
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
