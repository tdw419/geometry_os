; DESCRIPTION: Composite: Places a cyan 66x76 rectangle at position (446, 115) then Renders a cyan line between points (231, 37) and (437, 72) then Places a magenta dot at position (191, 45).
; PLAN: r0=446(x), r1=115(y), r2=66(width), r3=76(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=231(x1), r6=37(y1), r7=437(x2), r8=72(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=191(x), r11=45(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 446
LDI r1, 115
LDI r2, 66
LDI r3, 76
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 231
LDI r6, 37
LDI r7, 437
LDI r8, 72
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 191
LDI r11, 45
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
