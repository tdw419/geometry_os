; mixed program
; initialization
  LDI r12, 666
  LDI r8, 0
  LDI r0, 16
  LDI r27, 0x0FBB26
  LDI r15, 0x4AE319
  LDI r14, 3460
  LDI r6, 0xC6F2FF
  LDI r11, 4
  IKEY r9
  CMPI r9, 0xB2D2BF
  JNZ r9, key_0
  CMP r9, r3
  JZ r9, else_1
  SHR r10, r13, r14
  SUB r3, r9, r8
  JMP endif_2
else_1:
  LDI r13, 2897
  LDI r6, 0xCFD214
  LDI r10, 2077
  LDI r12, 2131
  LDI r8, 128
  RECTF r13, r6, r10, r12, r8
  LDI r14, 998
  LDI r5, 0xDA3BDE
  LDI r4, 3032
  PSET r14, r5, r4
  LDI r14, 32
  FILL r14
  LDI r13, 0x4E92BA
  LDI r11, 32
  LDI r10, 0xA88FA1
  LDI r6, 255
  LDI r14, 1
  RECTF r13, r11, r10, r6, r14
endif_2:
  LDI r0, 37
loop_3:
  LDI r7, 0x86F621
  LDI r14, 0xBD7D5E
  LDI r6, 1
  WPIXEL
  SUBI r15, r4, 138
  MOD r14, r10, r13
  XOR r19, r15, r6
  LDI r3, 1
  SUB r0, r0, r3
  JNZ r0, loop_3
  IKEY r3
  CMPI r3, 187
  JNZ r3, key_4
  LDI r12, 0x8DC8E5
loop_5:
  MOD r5, r12, r8
  MUL r2, r13, r6
  SHR r12, r9, r10
  ADDI r0, r6, 78
  LDI r8, 1
  SUB r12, r12, r8
  JNZ r12, loop_5
  CMP r8, r6
  JZ r8, else_6
  MUL r15, r6, r12
  AND r3, r13, r9
  DIV r9, r5, r6
  JMP endif_7
else_6:
  LDI r13, 2
  LDI r3, 0x717788
  LDI r15, 10
  PSET r13, r3, r15
  LDI r12, 1840
  LDI r14, 1415
  LDI r10, 2
  LDI r8, 3884
  LDI r1, 256
  LINE r12, r14, r10, r8, r1
  LDI r12, 0xC91747
  LDI r12, 0x76472E
  LDI r11, 32
  WPIXEL
endif_7:
  LDI r4, 255
  STORE r4, r9
  LOAD r11, r4
  LDI r5, 2732
  STORE r5, r1
  LOAD r7, r5
  LDI r0, 32
  STORE r0, r14
  LOAD r8, r0
  LDI r10, 0x762D06
  STORE r10, r3
  LOAD r4, r10
  LDI r4, 0xBAC725
  STORE r4, r2
  LOAD r9, r4
main_8:
  LDI r10, 255
  LDI r7, 4
  LDI r7, 2227
  TEXT r10, r7, r7, "HELLO"
  IKEY r25
  CMPI r25, 0x6F3AFE
  JNZ r25, key_9
  FRAME
  JMP main_8
