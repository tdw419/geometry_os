; DESCRIPTION: Renders a cyan box of size 68x44 starting at (46, 82).
; PLAN: r0=46(x), r1=82(y), r2=68(width), r3=44(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 82
LDI r2, 68
LDI r3, 44
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
